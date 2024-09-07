module TD.Query.LoadQuickReplyShortcuts
  (LoadQuickReplyShortcuts(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Loads quick reply shortcuts created by the current user. The loaded data will be sent through updateQuickReplyShortcut and updateQuickReplyShortcuts. Returns 'TD.Data.Ok.Ok'
data LoadQuickReplyShortcuts
  = LoadQuickReplyShortcuts
  deriving (Eq, Show)

instance I.ShortShow LoadQuickReplyShortcuts where
  shortShow
    LoadQuickReplyShortcuts
        = "LoadQuickReplyShortcuts"

instance AT.ToJSON LoadQuickReplyShortcuts where
  toJSON
    LoadQuickReplyShortcuts
        = A.object
          [ "@type" A..= AT.String "loadQuickReplyShortcuts"
          ]

