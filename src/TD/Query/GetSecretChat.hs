{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetSecretChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a secret chat by its identifier. This is an offline request @secret_chat_id Secret chat identifier
data GetSecretChat = GetSecretChat
  { -- |
    secret_chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetSecretChat where
  show
    GetSecretChat
      { secret_chat_id = secret_chat_id_
      } =
      "GetSecretChat"
        ++ U.cc
          [ U.p "secret_chat_id" secret_chat_id_
          ]

instance T.ToJSON GetSecretChat where
  toJSON
    GetSecretChat
      { secret_chat_id = secret_chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getSecretChat",
          "secret_chat_id" A..= secret_chat_id_
        ]
