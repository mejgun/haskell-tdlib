module TD.Query.SetQuickReplyShortcutName
  (SetQuickReplyShortcutName(..)
  , defaultSetQuickReplyShortcutName
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes name of a quick reply shortcut. Returns 'TD.Data.Ok.Ok'
data SetQuickReplyShortcutName
  = SetQuickReplyShortcutName
    { shortcut_id :: Maybe Int    -- ^ Unique identifier of the quick reply shortcut
    , name        :: Maybe T.Text -- ^ New name for the shortcut. Use checkQuickReplyShortcutName to check its validness
    }
  deriving (Eq, Show)

instance I.ShortShow SetQuickReplyShortcutName where
  shortShow
    SetQuickReplyShortcutName
      { shortcut_id = shortcut_id_
      , name        = name_
      }
        = "SetQuickReplyShortcutName"
          ++ I.cc
          [ "shortcut_id" `I.p` shortcut_id_
          , "name"        `I.p` name_
          ]

instance AT.ToJSON SetQuickReplyShortcutName where
  toJSON
    SetQuickReplyShortcutName
      { shortcut_id = shortcut_id_
      , name        = name_
      }
        = A.object
          [ "@type"       A..= AT.String "setQuickReplyShortcutName"
          , "shortcut_id" A..= shortcut_id_
          , "name"        A..= name_
          ]

defaultSetQuickReplyShortcutName :: SetQuickReplyShortcutName
defaultSetQuickReplyShortcutName =
  SetQuickReplyShortcutName
    { shortcut_id = Nothing
    , name        = Nothing
    }

