package com.carrental.utill;

import com.carrental.config.DSProvider;

import java.sql.Connection;
import java.util.function.Consumer;
import java.util.function.Function;

public class ConnectionUtil {

    public static <T> T withConnection(Function<Connection, T> command) {
        try (Connection conn = DSProvider.getConnection()) {
            return command.apply(conn);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void withConnectionVoid(Consumer<Connection> action) {
        try (Connection conn = DSProvider.getConnection()) {
            action.accept(conn);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
