module TD.Query.ResetBackgrounds where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ResetBackgrounds -- ^ Resets list of installed backgrounds to its default value
  = ResetBackgrounds
  deriving (Eq)

instance Show ResetBackgrounds where
  show
    ResetBackgrounds
        = "ResetBackgrounds"

instance AT.ToJSON ResetBackgrounds where
  toJSON
    ResetBackgrounds
        = A.object
          [ "@type" A..= AT.String "resetBackgrounds"
          ]
