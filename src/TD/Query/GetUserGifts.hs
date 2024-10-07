module TD.Query.GetUserGifts
  (GetUserGifts(..)
  , defaultGetUserGifts
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns gifts saved to profile by the given user. Returns 'TD.Data.UserGifts.UserGifts'
data GetUserGifts
  = GetUserGifts
    { user_id :: Maybe Int    -- ^ Identifier of the user
    , offset  :: Maybe T.Text -- ^ Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    , limit   :: Maybe Int    -- ^ The maximum number of gifts to be returned; must be positive and can't be greater than 100. For optimal performance, the number of returned objects is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq, Show)

instance I.ShortShow GetUserGifts where
  shortShow
    GetUserGifts
      { user_id = user_id_
      , offset  = offset_
      , limit   = limit_
      }
        = "GetUserGifts"
          ++ I.cc
          [ "user_id" `I.p` user_id_
          , "offset"  `I.p` offset_
          , "limit"   `I.p` limit_
          ]

instance AT.ToJSON GetUserGifts where
  toJSON
    GetUserGifts
      { user_id = user_id_
      , offset  = offset_
      , limit   = limit_
      }
        = A.object
          [ "@type"   A..= AT.String "getUserGifts"
          , "user_id" A..= user_id_
          , "offset"  A..= offset_
          , "limit"   A..= limit_
          ]

defaultGetUserGifts :: GetUserGifts
defaultGetUserGifts =
  GetUserGifts
    { user_id = Nothing
    , offset  = Nothing
    , limit   = Nothing
    }

