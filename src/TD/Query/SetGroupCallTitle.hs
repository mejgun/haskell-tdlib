module TD.Query.SetGroupCallTitle
  (SetGroupCallTitle(..)
  , defaultSetGroupCallTitle
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Sets group call title. Requires groupCall.can_be_managed group call flag. Returns 'TD.Data.Ok.Ok'
data SetGroupCallTitle
  = SetGroupCallTitle
    { group_call_id :: Maybe Int    -- ^ Group call identifier
    , title         :: Maybe T.Text -- ^ New group call title; 1-64 characters
    }
  deriving (Eq, Show)

instance I.ShortShow SetGroupCallTitle where
  shortShow
    SetGroupCallTitle
      { group_call_id = group_call_id_
      , title         = title_
      }
        = "SetGroupCallTitle"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          , "title"         `I.p` title_
          ]

instance AT.ToJSON SetGroupCallTitle where
  toJSON
    SetGroupCallTitle
      { group_call_id = group_call_id_
      , title         = title_
      }
        = A.object
          [ "@type"         A..= AT.String "setGroupCallTitle"
          , "group_call_id" A..= group_call_id_
          , "title"         A..= title_
          ]

defaultSetGroupCallTitle :: SetGroupCallTitle
defaultSetGroupCallTitle =
  SetGroupCallTitle
    { group_call_id = Nothing
    , title         = Nothing
    }

