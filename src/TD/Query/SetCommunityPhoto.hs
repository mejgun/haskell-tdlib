module TD.Query.SetCommunityPhoto
  (SetCommunityPhoto(..)
  , defaultSetCommunityPhoto
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputChatPhoto as InputChatPhoto

-- | Changes the photo of a community; requires can_change_info administrator right in the community. Returns 'TD.Data.Ok.Ok'
data SetCommunityPhoto
  = SetCommunityPhoto
    { community_id :: Maybe Int                           -- ^ Identifier of the community
    , photo        :: Maybe InputChatPhoto.InputChatPhoto -- ^ New community photo; pass null to delete the community photo
    }
  deriving (Eq, Show)

instance I.ShortShow SetCommunityPhoto where
  shortShow
    SetCommunityPhoto
      { community_id = community_id_
      , photo        = photo_
      }
        = "SetCommunityPhoto"
          ++ I.cc
          [ "community_id" `I.p` community_id_
          , "photo"        `I.p` photo_
          ]

instance AT.ToJSON SetCommunityPhoto where
  toJSON
    SetCommunityPhoto
      { community_id = community_id_
      , photo        = photo_
      }
        = A.object
          [ "@type"        A..= AT.String "setCommunityPhoto"
          , "community_id" A..= community_id_
          , "photo"        A..= photo_
          ]

defaultSetCommunityPhoto :: SetCommunityPhoto
defaultSetCommunityPhoto =
  SetCommunityPhoto
    { community_id = Nothing
    , photo        = Nothing
    }

