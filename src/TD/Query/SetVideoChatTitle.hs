module TD.Query.SetVideoChatTitle
  (SetVideoChatTitle(..)
  , defaultSetVideoChatTitle
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Sets title of a video chat; requires groupCall.can_be_managed right. Returns 'TD.Data.Ok.Ok'
data SetVideoChatTitle
  = SetVideoChatTitle
    { group_call_id :: Maybe Int    -- ^ Group call identifier
    , title         :: Maybe T.Text -- ^ New group call title; 1-64 characters
    }
  deriving (Eq, Show)

instance I.ShortShow SetVideoChatTitle where
  shortShow
    SetVideoChatTitle
      { group_call_id = group_call_id_
      , title         = title_
      }
        = "SetVideoChatTitle"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          , "title"         `I.p` title_
          ]

instance AT.ToJSON SetVideoChatTitle where
  toJSON
    SetVideoChatTitle
      { group_call_id = group_call_id_
      , title         = title_
      }
        = A.object
          [ "@type"         A..= AT.String "setVideoChatTitle"
          , "group_call_id" A..= group_call_id_
          , "title"         A..= title_
          ]

defaultSetVideoChatTitle :: SetVideoChatTitle
defaultSetVideoChatTitle =
  SetVideoChatTitle
    { group_call_id = Nothing
    , title         = Nothing
    }

