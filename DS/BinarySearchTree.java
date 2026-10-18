class Node {
    int value;
    Node left, right;

    Node(int value) {
        this.value = value;
        left = right = null;
    }
}

public class BinarySearchTree {
    Node root;

    // Insert
    void insert(int value) {
        Node newNode = new Node(value);

        if (root == null) {
            root = newNode;
            return;
        }

        Node current = root;
        Node parent = null;

        while (current != null) {
            parent = current;
            if (value < current.value) {
                current = current.left;
            } else {
                current = current.right;
            }
        }

        if (value < parent.value)
            parent.left = newNode;
        else
            parent.right = newNode;
    }

    // Delete
    void delete(int value) {
        root = deleteNode(root, value);
    }

    Node deleteNode(Node root, int value) {
        if (root == null)
            return root;

        if (value < root.value)
            root.left = deleteNode(root.left, value);
        else if (value > root.value)
            root.right = deleteNode(root.right, value);
        else { // if (value == root.value) {// Node to delete found}

            // Case 1: no child
            if (root.left == null && root.right == null)
                return null;

            // Case 2: one child
            if (root.left == null)
                return root.right;
            if (root.right == null)
                return root.left;

            // Case 3: two children => get smallest from right subtree
            Node temp = root.right;
            while (temp.left != null)
                temp = temp.left;

            root.value = temp.value;                        // replace value
            root.right = deleteNode(root.right, temp.value); // delete duplicate
        }

        return root;
    }

    // Inorder traversal
    void inorder(Node root) {
        if (root != null) {
            inorder(root.left);
            System.out.print(root.value + " ");
            inorder(root.right);
        }
    }

    public static void main(String[] args) {
        BinarySearchTree bst = new BinarySearchTree();

        bst.insert(50);
        bst.insert(30);
        bst.insert(70);
        bst.insert(20);
        bst.insert(40);

        System.out.print("Before deletion: ");
        bst.inorder(bst.root);

        bst.delete(30);

        System.out.print("\nAfter deletion:  ");
        bst.inorder(bst.root);
        System.out.println();
    }
}
