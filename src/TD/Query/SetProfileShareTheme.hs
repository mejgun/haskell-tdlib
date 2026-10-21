module TD.Query.SetProfileShareTheme
  (SetProfileShareTheme(..)
  , defaultSetProfileShareTheme
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputProfileShareTheme as InputProfileShareTheme

-- | Changes the theme of the screen for sharing a link to the current user or a chat. The chat must have a username. Requires can_change_info administrator right in supergroups and channels. Returns 'TD.Data.Ok.Ok'
data SetProfileShareTheme
  = SetProfileShareTheme
    { chat_id :: Maybe Int                                           -- ^ Identifier of the chat with the current user, or identifier of a supergroup or a channel chat
    , theme   :: Maybe InputProfileShareTheme.InputProfileShareTheme -- ^ The new theme; pass null to use the default theme
    }
  deriving (Eq, Show)

instance I.ShortShow SetProfileShareTheme where
  shortShow
    SetProfileShareTheme
      { chat_id = chat_id_
      , theme   = theme_
      }
        = "SetProfileShareTheme"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          , "theme"   `I.p` theme_
          ]

instance AT.ToJSON SetProfileShareTheme where
  toJSON
    SetProfileShareTheme
      { chat_id = chat_id_
      , theme   = theme_
      }
        = A.object
          [ "@type"   A..= AT.String "setProfileShareTheme"
          , "chat_id" A..= chat_id_
          , "theme"   A..= theme_
          ]

defaultSetProfileShareTheme :: SetProfileShareTheme
defaultSetProfileShareTheme =
  SetProfileShareTheme
    { chat_id = Nothing
    , theme   = Nothing
    }

