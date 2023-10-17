module TD.Query.RemoveBackground
  (RemoveBackground(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Removes background from the list of installed backgrounds
data RemoveBackground
  = RemoveBackground
    { background_id :: Maybe Int -- ^ The background identifier
    }
  deriving (Eq, Show)

instance I.ShortShow RemoveBackground where
  shortShow
    RemoveBackground
      { background_id = background_id_
      }
        = "RemoveBackground"
          ++ I.cc
          [ "background_id" `I.p` background_id_
          ]

instance AT.ToJSON RemoveBackground where
  toJSON
    RemoveBackground
      { background_id = background_id_
      }
        = A.object
          [ "@type"         A..= AT.String "removeBackground"
          , "background_id" A..= fmap I.writeInt64  background_id_
          ]

