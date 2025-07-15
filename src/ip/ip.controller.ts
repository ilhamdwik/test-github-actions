import { Controller, Get, Req } from '@nestjs/common';
import { Request } from 'express';

@Controller('ip')
export class IpController {
  @Get()
  getClientIP(@Req() request: Request): string {
    const forwarded = request.headers['x-forwarded-for'];
    const ip = typeof forwarded === 'string'
      ? forwarded.split(',')[0]
      : request.connection.remoteAddress;
    return `IP Address: ${ip}`;
  }
}
