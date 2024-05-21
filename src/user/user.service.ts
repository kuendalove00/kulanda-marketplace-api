import { Injectable, UnauthorizedException } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class UserService {
  constructor(private prisma: PrismaService){}

  async create(data : CreateUserDto) {
    const user = await this.prisma.user.create({ data });
    return user;
  }

  async findAll() {
    const users = await this.prisma.user.findMany();
    return users;
  }

  async findOne(id: number) {
    const user = await this.prisma.user.findUnique({
      where: {
        id: id
      }
    });

    return user;
  }

  async update(id: number, data: UpdateUserDto) {
    const user = await this.prisma.user.update({
      where: {
        id:id
      },
      data
    });

    return user;
  }

  async remove(id: number) {
    const user = await this.prisma.user.delete({
      where: {
        id: id
      }
    });

    return user;
  }


  async login(email: string, password: string) {
    // Validar as credenciais
    const utilizador = await this.prisma.user.findFirst({
      where: {
        email: email,
        password: password,
      },
    });

    if (!utilizador) {
      throw new UnauthorizedException('Credenciais inválidas');
    }

    

    return utilizador;
  }
}
