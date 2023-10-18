module TD.Query.SetBotName
  (SetBotName(..)
  , defaultSetBotName
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Sets the name of a bot. Can be called only if userTypeBot.can_be_edited == true. Returns 'TD.Data.Ok.Ok'
data SetBotName
  = SetBotName
    { bot_user_id   :: Maybe Int    -- ^ Identifier of the target bot
    , language_code :: Maybe T.Text -- ^ A two-letter ISO 639-1 language code. If empty, the name will be shown to all users for whose languages there is no dedicated name
    , name          :: Maybe T.Text -- ^ New bot's name on the specified language; 0-64 characters; must be non-empty if language code is empty
    }
  deriving (Eq, Show)

instance I.ShortShow SetBotName where
  shortShow
    SetBotName
      { bot_user_id   = bot_user_id_
      , language_code = language_code_
      , name          = name_
      }
        = "SetBotName"
          ++ I.cc
          [ "bot_user_id"   `I.p` bot_user_id_
          , "language_code" `I.p` language_code_
          , "name"          `I.p` name_
          ]

instance AT.ToJSON SetBotName where
  toJSON
    SetBotName
      { bot_user_id   = bot_user_id_
      , language_code = language_code_
      , name          = name_
      }
        = A.object
          [ "@type"         A..= AT.String "setBotName"
          , "bot_user_id"   A..= bot_user_id_
          , "language_code" A..= language_code_
          , "name"          A..= name_
          ]

defaultSetBotName :: SetBotName
defaultSetBotName =
  SetBotName
    { bot_user_id   = Nothing
    , language_code = Nothing
    , name          = Nothing
    }

