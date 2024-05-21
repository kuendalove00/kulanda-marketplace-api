import { PrismaService } from './../prisma/prisma.service';
import { Injectable } from '@nestjs/common';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';


@Injectable()
export class ProductService {

  constructor(private prisma: PrismaService){}

  async create(data : CreateProductDto , files : Array<Express.Multer.File>) {
    const product = await this.prisma.products.create({ data });
    return product;
  }

  async findAll() {
    const products = await this.prisma.products.findMany();
    return products;
  }

  async findOne(id: number) {
    const product = await this.prisma.products.findUnique({
      where: {
        id: id
      }
    });

    return product;
  }

  async update(id: number, data: UpdateProductDto) {
    const product = await this.prisma.products.update({
      where: {
        id:id
      },
      data
    });

    return product;
  }

  async remove(id: number) {
    const product = await this.prisma.products.delete({
      where: {
        id: id
      }
    });

    return product;
  }
}
