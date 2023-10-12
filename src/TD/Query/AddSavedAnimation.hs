module TD.Query.AddSavedAnimation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile

data AddSavedAnimation -- ^ Manually adds a new animation to the list of saved animations. The new animation is added to the beginning of the list. If the animation was already in the list, it is removed first. Only non-secret video animations with MIME type "video/mp4" can be added to the list
  = AddSavedAnimation
    { animation :: Maybe InputFile.InputFile -- ^ The animation file to be added. Only animations known to the server (i.e., successfully sent via a message) can be added to the list
    }
  deriving (Eq)

instance Show AddSavedAnimation where
  show
    AddSavedAnimation
      { animation = animation_
      }
        = "AddSavedAnimation"
          ++ I.cc
          [ "animation" `I.p` animation_
          ]

instance AT.ToJSON AddSavedAnimation where
  toJSON
    AddSavedAnimation
      { animation = animation_
      }
        = A.object
          [ "@type"     A..= AT.String "addSavedAnimation"
          , "animation" A..= animation_
          ]
