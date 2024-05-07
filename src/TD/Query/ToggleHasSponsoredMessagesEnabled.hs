module TD.Query.ToggleHasSponsoredMessagesEnabled
  (ToggleHasSponsoredMessagesEnabled(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether the current user has sponsored messages enabled. The setting has no effect for users without Telegram Premium for which sponsored messages are always enabled. Returns 'TD.Data.Ok.Ok'
data ToggleHasSponsoredMessagesEnabled
  = ToggleHasSponsoredMessagesEnabled
    { has_sponsored_messages_enabled :: Maybe Bool -- ^ Pass true to enable sponsored messages for the current user; false to disable them
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleHasSponsoredMessagesEnabled where
  shortShow
    ToggleHasSponsoredMessagesEnabled
      { has_sponsored_messages_enabled = has_sponsored_messages_enabled_
      }
        = "ToggleHasSponsoredMessagesEnabled"
          ++ I.cc
          [ "has_sponsored_messages_enabled" `I.p` has_sponsored_messages_enabled_
          ]

instance AT.ToJSON ToggleHasSponsoredMessagesEnabled where
  toJSON
    ToggleHasSponsoredMessagesEnabled
      { has_sponsored_messages_enabled = has_sponsored_messages_enabled_
      }
        = A.object
          [ "@type"                          A..= AT.String "toggleHasSponsoredMessagesEnabled"
          , "has_sponsored_messages_enabled" A..= has_sponsored_messages_enabled_
          ]

