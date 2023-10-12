module TD.Query.SuggestUserProfilePhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputChatPhoto as InputChatPhoto

data SuggestUserProfilePhoto -- ^ Suggests a profile photo to another regular user with common messages
  = SuggestUserProfilePhoto
    { user_id :: Maybe Int                           -- ^ User identifier
    , photo   :: Maybe InputChatPhoto.InputChatPhoto -- ^ Profile photo to suggest; inputChatPhotoPrevious isn't supported in this function
    }
  deriving (Eq)

instance Show SuggestUserProfilePhoto where
  show
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
