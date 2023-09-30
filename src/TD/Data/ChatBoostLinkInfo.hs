{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatBoostLinkInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ChatBoostLinkInfo = -- | Contains information about a link to boost a a chat
  ChatBoostLinkInfo
  { -- | Identifier of the chat to which the link points; 0 if the chat isn't found
    chat_id :: Maybe Int,
    -- | True, if the link will work for non-members of the chat
    is_public :: Maybe Bool
  }
  deriving (Eq)

instance Show ChatBoostLinkInfo where
  show
    ChatBoostLinkInfo
      { chat_id = chat_id_,
        is_public = is_public_
      } =
      "ChatBoostLinkInfo"
        ++ U.cc
          [ U.p "chat_id" chat_id_,
            U.p "is_public" is_public_
          ]

instance T.FromJSON ChatBoostLinkInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatBoostLinkInfo" -> parseChatBoostLinkInfo v
      _ -> mempty
    where
      parseChatBoostLinkInfo :: A.Value -> T.Parser ChatBoostLinkInfo
      parseChatBoostLinkInfo = A.withObject "ChatBoostLinkInfo" $ \o -> do
        chat_id_ <- o A..:? "chat_id"
        is_public_ <- o A..:? "is_public"
        return $ ChatBoostLinkInfo {chat_id = chat_id_, is_public = is_public_}
  parseJSON _ = mempty

instance T.ToJSON ChatBoostLinkInfo where
  toJSON
    ChatBoostLinkInfo
      { chat_id = chat_id_,
        is_public = is_public_
      } =
      A.object
        [ "@type" A..= T.String "chatBoostLinkInfo",
          "chat_id" A..= chat_id_,
          "is_public" A..= is_public_
        ]
