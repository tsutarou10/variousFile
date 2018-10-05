import javax.swing.JFrame;
import javax.swing.JPanel;
import java.awt.*;
import java.awt.event.*;
import java.util.ArrayList;
import java.util.Random;

public class TurtleGraphics {

	public static void main(String[] args) {
		JFrame fr = new JFrame("Turtle Graphics");
		fr.setSize(400, 400);
		fr.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		fr.getContentPane().setBackground(new Color(255, 255, 255));

		TurtleGraphicsPanel panel = new TurtleGraphicsPanel();
		panel.setOpaque(false);
		fr.add(panel);
		fr.setVisible(true);
	}
}

class TurtleGraphicsPanel extends JPanel {
	private Turtle kamekichi;

	TurtleGraphicsPanel() {
		kamekichi = new Turtle(200, 200);
		freePaint(kamekichi);
		//triangles(kamekichi, 40, 2, 10);
		//triangles(kamekichi, 40, 2, 20);
		//square(kamekichi);
	}

	public void freePaint(Turtle t) {
		for(int i = 3; i <= 10; i++) {
			for(int j = 0; j < i; j++) {
				t.move(50);
				t.turn(180.0 - 180.0 * (i - 2) / i);
			}
		}
	}
	public void square(Turtle t) {
		for(int i = 0; i < 4; i++) {
			t.move(50);
			t.turn(90);
		}
	}

	public void triangle(Turtle t, int size) {
		for(int i = 0; i < 3; i++) {
			t.move(size);
			t.turn(120);
		}
	}

	public void triangles(Turtle t, int n, int c, int d) {
		for(int i = 0; i < n; i++) {
			triangle(t, i * c);
			t.turn(d);
		}
	}

	@Override
	public void paintComponent(Graphics g) {
		kamekichi.paint(g);
	}
}

class Turtle {
	private double current_x, current_y;
	private double angle;
	private ArrayList <Point> tracks = new ArrayList<Point>();

	Turtle(int current_x, int current_y) {
		this.current_x = (double)current_x;
		this.current_y = (double)current_y;
		Point p = new Point((int)this.current_x, (int)this.current_y);
		tracks.add(p);
	}

	public void move(double length) {
		this.current_x += length * Math.cos(this.angle * Math.PI / 180.0);
		this.current_y -= length * Math.sin(this.angle * Math.PI / 180.0);
		tracks.add(new Point((int) this.current_x, (int) this.current_y));
	}

	public void turn(double deg) {
		this.angle += deg;
		while(this.angle >= 360) this.angle -= 360;
		System.out.println(this.angle);
	}

	public void paint(Graphics g) {
		for(int i = 0; i < this.tracks.size() - 1; i++) {
			int x1 = (int)tracks.get(i).getX();
			int y1 = (int)tracks.get(i).getY();
			int x2 = (int)tracks.get(i + 1).getX();
			int y2 = (int)tracks.get(i + 1).getY();
			g.drawLine(x1, y1, x2, y2);
		}
	}
}


	

