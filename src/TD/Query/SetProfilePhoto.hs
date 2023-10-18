module TD.Query.SetProfilePhoto
  (SetProfilePhoto(..)
  , defaultSetProfilePhoto
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputChatPhoto as InputChatPhoto

-- | Changes a profile photo for the current user. Returns 'TD.Data.Ok.Ok'
data SetProfilePhoto
  = SetProfilePhoto
    { photo     :: Maybe InputChatPhoto.InputChatPhoto -- ^ Profile photo to set
    , is_public :: Maybe Bool                          -- ^ Pass true to set a public photo, which will be visible even the main photo is hidden by privacy settings
    }
  deriving (Eq, Show)

instance I.ShortShow SetProfilePhoto where
  shortShow
    SetProfilePhoto
      { photo     = photo_
      , is_public = is_public_
      }
        = "SetProfilePhoto"
          ++ I.cc
          [ "photo"     `I.p` photo_
          , "is_public" `I.p` is_public_
          ]

instance AT.ToJSON SetProfilePhoto where
  toJSON
    SetProfilePhoto
      { photo     = photo_
      , is_public = is_public_
      }
        = A.object
          [ "@type"     A..= AT.String "setProfilePhoto"
          , "photo"     A..= photo_
          , "is_public" A..= is_public_
          ]

defaultSetProfilePhoto :: SetProfilePhoto
defaultSetProfilePhoto =
  SetProfilePhoto
    { photo     = Nothing
    , is_public = Nothing
    }

