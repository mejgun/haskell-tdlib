module TD.Query.SetBotInfoShortDescription
  (SetBotInfoShortDescription(..)
  , defaultSetBotInfoShortDescription
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Sets the text shown on a bot's profile page and sent together with the link when users share the bot. Can be called only if userTypeBot.can_be_edited == true. Returns 'TD.Data.Ok.Ok'
data SetBotInfoShortDescription
  = SetBotInfoShortDescription
    { bot_user_id       :: Maybe Int    -- ^ Identifier of the target bot
    , language_code     :: Maybe T.Text -- ^ A two-letter ISO 639-1 language code. If empty, the short description will be shown to all users for whose languages there is no dedicated description
    , short_description :: Maybe T.Text -- ^ New bot's short description on the specified language
    }
  deriving (Eq, Show)

instance I.ShortShow SetBotInfoShortDescription where
  shortShow
    SetBotInfoShortDescription
      { bot_user_id       = bot_user_id_
      , language_code     = language_code_
      , short_description = short_description_
      }
        = "SetBotInfoShortDescription"
          ++ I.cc
          [ "bot_user_id"       `I.p` bot_user_id_
          , "language_code"     `I.p` language_code_
          , "short_description" `I.p` short_description_
          ]

instance AT.ToJSON SetBotInfoShortDescription where
  toJSON
    SetBotInfoShortDescription
      { bot_user_id       = bot_user_id_
      , language_code     = language_code_
      , short_description = short_description_
      }
        = A.object
          [ "@type"             A..= AT.String "setBotInfoShortDescription"
          , "bot_user_id"       A..= bot_user_id_
          , "language_code"     A..= language_code_
          , "short_description" A..= short_description_
          ]

defaultSetBotInfoShortDescription :: SetBotInfoShortDescription
defaultSetBotInfoShortDescription =
  SetBotInfoShortDescription
    { bot_user_id       = Nothing
    , language_code     = Nothing
    , short_description = Nothing
    }

