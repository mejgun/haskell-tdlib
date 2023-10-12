module TD.Query.SetBotInfoDescription where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data SetBotInfoDescription -- ^ Sets the text shown in the chat with a bot if the chat is empty. Can be called only if userTypeBot.can_be_edited == true
  = SetBotInfoDescription
    { bot_user_id   :: Maybe Int    -- ^ Identifier of the target bot
    , language_code :: Maybe T.Text -- ^ A two-letter ISO 639-1 language code. If empty, the description will be shown to all users for whose languages there is no dedicated description
    , description   :: Maybe T.Text
    }
  deriving (Eq)

instance Show SetBotInfoDescription where
  show
    SetBotInfoDescription
      { bot_user_id   = bot_user_id_
      , language_code = language_code_
      , description   = description_
      }
        = "SetBotInfoDescription"
          ++ I.cc
          [ "bot_user_id"   `I.p` bot_user_id_
          , "language_code" `I.p` language_code_
          , "description"   `I.p` description_
          ]

instance AT.ToJSON SetBotInfoDescription where
  toJSON
    SetBotInfoDescription
      { bot_user_id   = bot_user_id_
      , language_code = language_code_
      , description   = description_
      }
        = A.object
          [ "@type"         A..= AT.String "setBotInfoDescription"
          , "bot_user_id"   A..= bot_user_id_
          , "language_code" A..= language_code_
          , "description"   A..= description_
          ]
