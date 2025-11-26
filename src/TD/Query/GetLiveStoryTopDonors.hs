module TD.Query.GetLiveStoryTopDonors
  (GetLiveStoryTopDonors(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of top live story donors. Returns 'TD.Data.LiveStoryDonors.LiveStoryDonors'
data GetLiveStoryTopDonors
  = GetLiveStoryTopDonors
    { group_call_id :: Maybe Int -- ^ Group call identifier of the live story
    }
  deriving (Eq, Show)

instance I.ShortShow GetLiveStoryTopDonors where
  shortShow
    GetLiveStoryTopDonors
      { group_call_id = group_call_id_
      }
        = "GetLiveStoryTopDonors"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          ]

instance AT.ToJSON GetLiveStoryTopDonors where
  toJSON
    GetLiveStoryTopDonors
      { group_call_id = group_call_id_
      }
        = A.object
          [ "@type"         A..= AT.String "getLiveStoryTopDonors"
          , "group_call_id" A..= group_call_id_
          ]

