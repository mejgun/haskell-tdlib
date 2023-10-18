module TD.Query.SuggestUserProfilePhoto
  (SuggestUserProfilePhoto(..)
  , defaultSuggestUserProfilePhoto
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputChatPhoto as InputChatPhoto

-- | Suggests a profile photo to another regular user with common messages. Returns 'TD.Data.Ok.Ok'
data SuggestUserProfilePhoto
  = SuggestUserProfilePhoto
    { user_id :: Maybe Int                           -- ^ User identifier
    , photo   :: Maybe InputChatPhoto.InputChatPhoto -- ^ Profile photo to suggest; inputChatPhotoPrevious isn't supported in this function
    }
  deriving (Eq, Show)

instance I.ShortShow SuggestUserProfilePhoto where
  shortShow
    SuggestUserProfilePhoto
      { user_id = user_id_
      , photo   = photo_
      }
        = "SuggestUserProfilePhoto"
          ++ I.cc
          [ "user_id" `I.p` user_id_
          , "photo"   `I.p` photo_
          ]

instance AT.ToJSON SuggestUserProfilePhoto where
  toJSON
    SuggestUserProfilePhoto
      { user_id = user_id_
      , photo   = photo_
      }
        = A.object
          [ "@type"   A..= AT.String "suggestUserProfilePhoto"
          , "user_id" A..= user_id_
          , "photo"   A..= photo_
          ]

defaultSuggestUserProfilePhoto :: SuggestUserProfilePhoto
defaultSuggestUserProfilePhoto =
  SuggestUserProfilePhoto
    { user_id = Nothing
    , photo   = Nothing
    }

