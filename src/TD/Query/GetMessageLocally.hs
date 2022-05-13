{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetMessageLocally where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a message, if it is available without sending network request. This is an offline request @chat_id Identifier of the chat the message belongs to @message_id Identifier of the message to get
data GetMessageLocally = GetMessageLocally
  { -- |
    message_id :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetMessageLocally where
  show
    GetMessageLocally
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      "GetMessageLocally"
        ++ U.cc
          [ U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetMessageLocally where
  toJSON
    GetMessageLocally
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getMessageLocally",
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
