module TD.Query.EditBusinessChatLink
  (EditBusinessChatLink(..)
  , defaultEditBusinessChatLink
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.InputBusinessChatLink as InputBusinessChatLink

-- | Edits a business chat link of the current account. Requires Telegram Business subscription. Returns the edited link. Returns 'TD.Data.BusinessChatLink.BusinessChatLink'
data EditBusinessChatLink
  = EditBusinessChatLink
    { link      :: Maybe T.Text                                      -- ^ The link to edit
    , link_info :: Maybe InputBusinessChatLink.InputBusinessChatLink -- ^ New description of the link
    }
  deriving (Eq, Show)

instance I.ShortShow EditBusinessChatLink where
  shortShow
    EditBusinessChatLink
      { link      = link_
      , link_info = link_info_
      }
        = "EditBusinessChatLink"
          ++ I.cc
          [ "link"      `I.p` link_
          , "link_info" `I.p` link_info_
          ]

instance AT.ToJSON EditBusinessChatLink where
  toJSON
    EditBusinessChatLink
      { link      = link_
      , link_info = link_info_
      }
        = A.object
          [ "@type"     A..= AT.String "editBusinessChatLink"
          , "link"      A..= link_
          , "link_info" A..= link_info_
          ]

defaultEditBusinessChatLink :: EditBusinessChatLink
defaultEditBusinessChatLink =
  EditBusinessChatLink
    { link      = Nothing
    , link_info = Nothing
    }

