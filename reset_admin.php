<?php
include 'includes/db_connection.php';
$message = '';
$success = false;
if (isset($_POST['submit'])) {
    $p = $_POST['new_password'];
    $c = $_POST['confirm_password'];
    if (strlen($p) < 6) { $message = 'Password must be at least 6 characters.'; }
    elseif ($p !== $c) { $message = 'Passwords do not match.'; }
    else {
        $hashed = password_hash($p, PASSWORD_DEFAULT);
        $email = 'admin@hungryheaven.com';
        $check = mysqli_query($conn, "SELECT id FROM users WHERE email='$email' AND role='admin'");
        if (mysqli_num_rows($check) > 0) {
            $stmt = mysqli_prepare($conn, "UPDATE users SET password=? WHERE email=? AND role='admin'");
            mysqli_stmt_bind_param($stmt, 'ss', $hashed, $email);
            if (mysqli_stmt_execute($stmt)) { $success = true; $message = 'Password updated! You can now login.'; }
            else { $message = 'Error: ' . mysqli_error($conn); }
        } else {
            $stmt = mysqli_prepare($conn, "INSERT INTO users (name,email,phone,password,role,created_at) VALUES('Admin',?,'1234567890',?,'admin',NOW())");
            mysqli_stmt_bind_param($stmt, 'ss', $email, $hashed);
            if (mysqli_stmt_execute($stmt)) { $success = true; $message = 'Admin created! You can now login.'; }
            else { $message = 'Error: ' . mysqli_error($conn); }
        }
    }
}
?>
<!DOCTYPE html>
<html>
<head><title>Reset Admin Password</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="d-flex align-items-center justify-content-center vh-100 bg-dark">
<div class="card shadow" style="width:380px;">
<div class="card-header bg-danger text-white text-center"><h3>Reset Admin Password</h3></div>
<div class="card-body">
<?php if($message): ?>
<div class="alert alert-<?php echo $success?'success':'danger'; ?>"><?php echo htmlspecialchars($message); ?></div>
<?php endif; ?>
<form method="post">
<div class="mb-3"><label class="form-label">New Password</label>
<input type="password" name="new_password" class="form-control" required minlength="6"></div>
<div class="mb-3"><label class="form-label">Confirm Password</label>
<input type="password" name="confirm_password" class="form-control" required></div>
<button type="submit" name="submit" class="btn btn-danger w-100">Reset Password</button>
</form>
<?php if($success): ?>
<a href="admin/login.php" class="btn btn-success w-100 mt-2">Go to Admin Login</a>
<?php endif; ?>
<p class="text-danger mt-3 small"><strong>Warning:</strong> Delete this file after use!</p>
</div></div></body></html>
