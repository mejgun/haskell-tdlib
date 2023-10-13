module TD.Query.ShareUserWithBot
  (ShareUserWithBot(..)
  , defaultShareUserWithBot
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Shares a user after pressing a keyboardButtonTypeRequestUser button with the bot
data ShareUserWithBot
  = ShareUserWithBot
    { chat_id        :: Maybe Int  -- ^ Identifier of the chat with the bot
    , message_id     :: Maybe Int  -- ^ Identifier of the message with the button
    , button_id      :: Maybe Int  -- ^ Identifier of the button
    , shared_user_id :: Maybe Int  -- ^ Identifier of the shared user
    , only_check     :: Maybe Bool -- ^ Pass true to check that the user can be shared by the button instead of actually sharing them
    }
  deriving (Eq)

instance Show ShareUserWithBot where
  show
    ShareUserWithBot
      { chat_id        = chat_id_
      , message_id     = message_id_
      , button_id      = button_id_
      , shared_user_id = shared_user_id_
      , only_check     = only_check_
      }
        = "ShareUserWithBot"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "message_id"     `I.p` message_id_
          , "button_id"      `I.p` button_id_
          , "shared_user_id" `I.p` shared_user_id_
          , "only_check"     `I.p` only_check_
          ]

instance AT.ToJSON ShareUserWithBot where
  toJSON
    ShareUserWithBot
      { chat_id        = chat_id_
      , message_id     = message_id_
      , button_id      = button_id_
      , shared_user_id = shared_user_id_
      , only_check     = only_check_
      }
        = A.object
          [ "@type"          A..= AT.String "shareUserWithBot"
          , "chat_id"        A..= chat_id_
          , "message_id"     A..= message_id_
          , "button_id"      A..= button_id_
          , "shared_user_id" A..= shared_user_id_
          , "only_check"     A..= only_check_
          ]

defaultShareUserWithBot :: ShareUserWithBot
defaultShareUserWithBot =
  ShareUserWithBot
    { chat_id        = Nothing
    , message_id     = Nothing
    , button_id      = Nothing
    , shared_user_id = Nothing
    , only_check     = Nothing
    }

