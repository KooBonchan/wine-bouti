package com.winebouti.config;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

public class UuidTypeHandler extends BaseTypeHandler<UUID> {
    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, UUID parameter, JdbcType jdbcType) throws SQLException {
        if (parameter != null) {
            ps.setBytes(i, toBytes(parameter));  // Convert UUID to byte array (16 bytes)
        } else {
            ps.setNull(i, JdbcType.BINARY.TYPE_CODE);
        }
    }

    @Override
    public UUID getNullableResult(ResultSet rs, String columnName) throws SQLException {
        byte[] bytes = rs.getBytes(columnName);
        return bytes == null ? null : fromBytes(bytes);
    }

    @Override
    public UUID getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        byte[] bytes = rs.getBytes(columnIndex);
        return bytes == null ? null : fromBytes(bytes);
    }

    @Override
    public UUID getNullableResult(java.sql.CallableStatement cs, int columnIndex) throws SQLException {
        byte[] bytes = cs.getBytes(columnIndex);
        return bytes == null ? null : fromBytes(bytes);
    }

    // Helper method to convert UUID to byte array (16 bytes)
    private byte[] toBytes(UUID uuid) {
        byte[] bytes = new byte[16];
        long mostSigBits = uuid.getMostSignificantBits();
        long leastSigBits = uuid.getLeastSignificantBits();
        
        for (int i = 0; i < 8; i++) {
            bytes[i] = (byte) (mostSigBits >>> (56 - i * 8));
            bytes[i + 8] = (byte) (leastSigBits >>> (56 - i * 8));
        }
        return bytes;
    }

    // Helper method to convert byte array (16 bytes) to UUID
    private UUID fromBytes(byte[] bytes) {
        if (bytes.length != 16) {
            throw new IllegalArgumentException("Byte array must be 16 bytes in length");
        }
        long mostSigBits = 0;
        long leastSigBits = 0;
        for (int i = 0; i < 8; i++) {
            mostSigBits |= ((long) bytes[i] & 0xff) << (56 - i * 8);
            leastSigBits |= ((long) bytes[i + 8] & 0xff) << (56 - i * 8);
        }
        return new UUID(mostSigBits, leastSigBits);
    }
}
