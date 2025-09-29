package net.koreate.bookstore.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SessionExpireInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        String uri = request.getRequestURI();
        String ctx = request.getContextPath();

        // 로그인 페이지 및 정적 리소스는 통과
        if (uri.startsWith(ctx + "/member/login") || uri.startsWith(ctx + "/resources/") || uri.startsWith(ctx + "/img/")) {
            return true;
        }

        HttpSession session = request.getSession(false);
        if (session != null) {
            Object expireMsg = session.getAttribute("expire");
            if (expireMsg != null) {
                log.info("Session marked as expired. Redirecting to login. msg={}", expireMsg);
                try {
                    // 로그인 상태 해제 및 만료 플래그 제거
                    session.removeAttribute("memberInfo");
                    session.removeAttribute("expire");
                    session.invalidate();
                } catch (IllegalStateException ignore) {}

                // 새로운 세션에 1회용 메시지 설정
                HttpSession newSession = request.getSession(true);
                newSession.setAttribute("msg", String.valueOf(expireMsg));

                response.sendRedirect(ctx + "/member/login");
                return false;
            }
        }

        return true;
    }
}


