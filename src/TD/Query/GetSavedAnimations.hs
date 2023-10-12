module TD.Query.GetSavedAnimations where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetSavedAnimations -- ^ Returns saved animations
  = GetSavedAnimations
  deriving (Eq)

instance Show GetSavedAnimations where
  show
    GetSavedAnimations
        = "GetSavedAnimations"

instance AT.ToJSON GetSavedAnimations where
  toJSON
    GetSavedAnimations
        = A.object
          [ "@type" A..= AT.String "getSavedAnimations"
          ]
