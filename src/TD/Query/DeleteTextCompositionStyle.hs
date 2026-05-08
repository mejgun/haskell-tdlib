module TD.Query.DeleteTextCompositionStyle
  (DeleteTextCompositionStyle(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Deletes a custom text composition style that was created by the current user. Returns 'TD.Data.Ok.Ok'
data DeleteTextCompositionStyle
  = DeleteTextCompositionStyle
    { name :: Maybe T.Text -- ^ Name of the style
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteTextCompositionStyle where
  shortShow
    DeleteTextCompositionStyle
      { name = name_
      }
        = "DeleteTextCompositionStyle"
          ++ I.cc
          [ "name" `I.p` name_
          ]

instance AT.ToJSON DeleteTextCompositionStyle where
  toJSON
    DeleteTextCompositionStyle
      { name = name_
      }
        = A.object
          [ "@type" A..= AT.String "deleteTextCompositionStyle"
          , "name"  A..= name_
          ]

