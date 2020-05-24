i= [125 1 0 0 0 1 0 0;0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0];
zig = zigzag(i);
rl = rle(zig);
rl2 = rle(rl);

symbole = unique(i);
dd = compute_hufftree(zig);