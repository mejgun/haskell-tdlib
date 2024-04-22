module TD.Query.CreateBusinessChatLink
  (CreateBusinessChatLink(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputBusinessChatLink as InputBusinessChatLink

-- | Creates a business chat link for the current account. Requires Telegram Business subscription. There can be up to getOption("business_chat_link_count_max") links created. Returns the created link. Returns 'TD.Data.BusinessChatLink.BusinessChatLink'
data CreateBusinessChatLink
  = CreateBusinessChatLink
    { link_info :: Maybe InputBusinessChatLink.InputBusinessChatLink -- ^ Information about the link to create
    }
  deriving (Eq, Show)

instance I.ShortShow CreateBusinessChatLink where
  shortShow
    CreateBusinessChatLink
      { link_info = link_info_
      }
        = "CreateBusinessChatLink"
          ++ I.cc
          [ "link_info" `I.p` link_info_
          ]

instance AT.ToJSON CreateBusinessChatLink where
  toJSON
    CreateBusinessChatLink
      { link_info = link_info_
      }
        = A.object
          [ "@type"     A..= AT.String "createBusinessChatLink"
          , "link_info" A..= link_info_
          ]

