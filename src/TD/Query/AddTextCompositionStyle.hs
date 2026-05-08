module TD.Query.AddTextCompositionStyle
  (AddTextCompositionStyle(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Adds a custom text composition style to the list of used by the user styles. May return an error with a message "TONES_SAVED_TOO_MANY" if the maximum number of added custom styles has been reached. Returns 'TD.Data.Ok.Ok'
data AddTextCompositionStyle
  = AddTextCompositionStyle
    { name :: Maybe T.Text -- ^ Name of the style
    }
  deriving (Eq, Show)

instance I.ShortShow AddTextCompositionStyle where
  shortShow
    AddTextCompositionStyle
      { name = name_
      }
        = "AddTextCompositionStyle"
          ++ I.cc
          [ "name" `I.p` name_
          ]

instance AT.ToJSON AddTextCompositionStyle where
  toJSON
    AddTextCompositionStyle
      { name = name_
      }
        = A.object
          [ "@type" A..= AT.String "addTextCompositionStyle"
          , "name"  A..= name_
          ]

