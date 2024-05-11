<?php
include 'functions.php';
$pdo = pdo_connect_pgsql();
$msg = '';
// Verifica se os dados POST não estão vazios
if (!empty($_POST)) {
    // Se os dados POST não estiverem vazios, insere um novo registro
    // Configura as variáveis que serão inseridas. Devemos verificar se as variáveis POST existem e, se não existirem, podemos atribuir um valor padrão a elas.
    $id_entrega = isset($_POST['id_entrega']) && !empty($_POST['id_entrega']) && $_POST['id_entrega'] != 'auto' ? $_POST['id_entrega'] : NULL;
    // Verifica se a variável POST "email" existe, se não existir, atribui o valor padrão para vazio, basicamente o mesmo para todas as variáveis
    $email = isset($_POST['email']) ? $_POST['email'] : '';
    $cel = isset($_POST['cel']) ? $_POST['cel'] : '';
    $pizza = isset($_POST['pizza']) ? $_POST['pizza'] : '';
    $cadastro = isset($_POST['cadastro']) ? $_POST['cadastro'] : date('Y-m-d H:i:s');
    // Insere um novo registro na tabela entregas
    $stmt = $pdo->prepare('INSERT INTO entregas (id_entrega, email, cel, pizza, cadastro) VALUES (?, ?, ?, ?, ?)');
    $stmt->execute([$id_entrega, $email, $cel, $pizza, $cadastro]);
    // Mensagem de saída
    $msg = 'Pedido Realizado com Sucesso!';
}
?>


<?=template_header('Cadastro de Pedidos')?>

<div class="content update">
    <h2>Registrar Pedido</h2>
    <form action="create.php" method="post">
        <label for="id_entrega">ID</label>
        <label for="email">Email</label>
        <input type="text" name="id_entrega" placeholder="" value="" id_entrega="id_entrega" >
        <input type="text" name="email" placeholder="seuemail@seuprovedor.com.br" id_entrega="email">
        <label for="cel">Celular</label>
        <label for="pizza">Sabor Pizza</label>
        <input type="text" name="cel" placeholder="(XX) X.XXXX-XXXX" id_entrega="cel">
        <input type="text" name="pizza" placeholder="Pizza" id_entrega="pizza">
        <label for="cadastro">Data do Pedido</label>
        <input type="datetime-local" name="cadastro" value="<?=date('Y-m-d\TH:i')?>" id_entrega="cadastro">
        <input type="submit" value="Realizar Pedido">
    </form>
    <?php if ($msg): ?>
    <p><?=$msg?></p>
    <?php endif; ?>
</div>

<?=template_footer()?>
