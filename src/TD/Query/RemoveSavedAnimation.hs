module TD.Query.RemoveSavedAnimation
  (RemoveSavedAnimation(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile

-- | Removes an animation from the list of saved animations
data RemoveSavedAnimation
  = RemoveSavedAnimation
    { animation :: Maybe InputFile.InputFile -- ^ Animation file to be removed
    }
  deriving (Eq)

instance Show RemoveSavedAnimation where
  show
    RemoveSavedAnimation
      { animation = animation_
      }
        = "RemoveSavedAnimation"
          ++ I.cc
          [ "animation" `I.p` animation_
          ]

instance AT.ToJSON RemoveSavedAnimation where
  toJSON
    RemoveSavedAnimation
      { animation = animation_
      }
        = A.object
          [ "@type"     A..= AT.String "removeSavedAnimation"
          , "animation" A..= animation_
          ]

