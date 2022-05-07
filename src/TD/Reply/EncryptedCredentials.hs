{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.EncryptedCredentials where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data EncryptedCredentials = -- | Contains encrypted Telegram Passport data credentials @data The encrypted credentials @hash The decrypted data hash @secret Secret for data decryption, encrypted with the service's public key
  EncryptedCredentials
  { -- |
    secret :: Maybe String,
    -- |
    hash :: Maybe String,
    -- |
    _data :: Maybe String
  }
  deriving (Eq)

instance Show EncryptedCredentials where
  show
    EncryptedCredentials
      { secret = secret,
        hash = hash,
        _data = _data
      } =
      "EncryptedCredentials"
        ++ U.cc
          [ U.p "secret" secret,
            U.p "hash" hash,
            U.p "_data" _data
          ]

instance T.FromJSON EncryptedCredentials where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "encryptedCredentials" -> parseEncryptedCredentials v
      _ -> fail ""
    where
      parseEncryptedCredentials :: A.Value -> T.Parser EncryptedCredentials
      parseEncryptedCredentials = A.withObject "EncryptedCredentials" $ \o -> do
        secret_ <- o A..:? "secret"
        hash_ <- o A..:? "hash"
        _data_ <- o A..:? "data"
        return $ EncryptedCredentials {secret = secret_, hash = hash_, _data = _data_}
  parseJSON _ = fail ""

instance T.ToJSON EncryptedCredentials where
  toJSON
    EncryptedCredentials
      { secret = secret,
        hash = hash,
        _data = _data
      } =
      A.object
        [ "@type" A..= T.String "encryptedCredentials",
          "secret" A..= secret,
          "hash" A..= hash,
          "data" A..= _data
        ]
