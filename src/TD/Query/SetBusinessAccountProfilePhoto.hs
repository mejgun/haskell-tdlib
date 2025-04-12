module TD.Query.SetBusinessAccountProfilePhoto
  (SetBusinessAccountProfilePhoto(..)
  , defaultSetBusinessAccountProfilePhoto
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.InputChatPhoto as InputChatPhoto

-- | Changes a profile photo of a business account; for bots only. Returns 'TD.Data.Ok.Ok'
data SetBusinessAccountProfilePhoto
  = SetBusinessAccountProfilePhoto
    { business_connection_id :: Maybe T.Text                        -- ^ Unique identifier of business connection
    , photo                  :: Maybe InputChatPhoto.InputChatPhoto -- ^ Profile photo to set; pass null to remove the photo
    , is_public              :: Maybe Bool                          -- ^ Pass true to set the public photo, which will be visible even the main photo is hidden by privacy settings
    }
  deriving (Eq, Show)

instance I.ShortShow SetBusinessAccountProfilePhoto where
  shortShow
    SetBusinessAccountProfilePhoto
      { business_connection_id = business_connection_id_
      , photo                  = photo_
      , is_public              = is_public_
      }
        = "SetBusinessAccountProfilePhoto"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "photo"                  `I.p` photo_
          , "is_public"              `I.p` is_public_
          ]

instance AT.ToJSON SetBusinessAccountProfilePhoto where
  toJSON
    SetBusinessAccountProfilePhoto
      { business_connection_id = business_connection_id_
      , photo                  = photo_
      , is_public              = is_public_
      }
        = A.object
          [ "@type"                  A..= AT.String "setBusinessAccountProfilePhoto"
          , "business_connection_id" A..= business_connection_id_
          , "photo"                  A..= photo_
          , "is_public"              A..= is_public_
          ]

defaultSetBusinessAccountProfilePhoto :: SetBusinessAccountProfilePhoto
defaultSetBusinessAccountProfilePhoto =
  SetBusinessAccountProfilePhoto
    { business_connection_id = Nothing
    , photo                  = Nothing
    , is_public              = Nothing
    }

