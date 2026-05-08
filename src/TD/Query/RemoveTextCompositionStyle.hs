module TD.Query.RemoveTextCompositionStyle
  (RemoveTextCompositionStyle(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Removes a custom text composition style from the list of used by the user styles. If the style was created by the current user, then it can only be deleted. Returns 'TD.Data.Ok.Ok'
data RemoveTextCompositionStyle
  = RemoveTextCompositionStyle
    { name :: Maybe T.Text -- ^ Name of the style
    }
  deriving (Eq, Show)

instance I.ShortShow RemoveTextCompositionStyle where
  shortShow
    RemoveTextCompositionStyle
      { name = name_
      }
        = "RemoveTextCompositionStyle"
          ++ I.cc
          [ "name" `I.p` name_
          ]

instance AT.ToJSON RemoveTextCompositionStyle where
  toJSON
    RemoveTextCompositionStyle
      { name = name_
      }
        = A.object
          [ "@type" A..= AT.String "removeTextCompositionStyle"
          , "name"  A..= name_
          ]

