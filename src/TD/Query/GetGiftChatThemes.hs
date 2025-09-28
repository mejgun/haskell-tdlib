module TD.Query.GetGiftChatThemes
  (GetGiftChatThemes(..)
  , defaultGetGiftChatThemes
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns available to the current user gift chat themes. Returns 'TD.Data.GiftChatThemes.GiftChatThemes'
data GetGiftChatThemes
  = GetGiftChatThemes
    { offset :: Maybe T.Text -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit  :: Maybe Int    -- ^ The maximum number of chat themes to return
    }
  deriving (Eq, Show)

instance I.ShortShow GetGiftChatThemes where
  shortShow
    GetGiftChatThemes
      { offset = offset_
      , limit  = limit_
      }
        = "GetGiftChatThemes"
          ++ I.cc
          [ "offset" `I.p` offset_
          , "limit"  `I.p` limit_
          ]

instance AT.ToJSON GetGiftChatThemes where
  toJSON
    GetGiftChatThemes
      { offset = offset_
      , limit  = limit_
      }
        = A.object
          [ "@type"  A..= AT.String "getGiftChatThemes"
          , "offset" A..= offset_
          , "limit"  A..= limit_
          ]

defaultGetGiftChatThemes :: GetGiftChatThemes
defaultGetGiftChatThemes =
  GetGiftChatThemes
    { offset = Nothing
    , limit  = Nothing
    }

