class DoublyLinkedList {
    static class Node {
        int data;
        Node prev;
        Node next;

        Node(int data) {
            this.data = data;
        }
    }

    private Node head;

    // Insert at the end
    public void insert(int data) {
        Node newNode = new Node(data);

        if (head == null) {
            head = newNode;
            return;
        }

        Node temp = head;
        while (temp.next != null) {
            temp = temp.next;
        }

        temp.next = newNode;
        newNode.prev = temp;
    }

    public void delete(int data) {
        if (head == null) return;

        Node temp = head;

        if (temp.data == data) {
            head = temp.next;
            if (head != null) head.prev = null;
            return;
        }

        while (temp != null && temp.data != data) {
            temp = temp.next;
        }

        if (temp == null) {
            return;
        }

        if (temp.next != null) {
            temp.next.prev = temp.prev;
        }

        if (temp.prev != null) {
            temp.prev.next = temp.next;
        }
    }

    public void traverse() {
        Node temp = head;
        while (temp != null) {
            System.out.print(temp.data + " ");
            temp = temp.next;
        }
        System.out.println();
    }

    public static void main(String[] args) {
        DoublyLinkedList dll = new DoublyLinkedList();

        dll.insert(10);
        dll.insert(20);
        dll.insert(30);
        dll.insert(40);

        System.out.print("Original: ");
        dll.traverse();      // 10 20 30 40

        dll.delete(20);
        System.out.print("After deleting 20: ");
        dll.traverse();      // 10 30 40

        dll.delete(10);
        System.out.print("After deleting 10: ");
        dll.traverse();      // 30 40
    }
}
