module TD.Query.GetMessageEffect
  (GetMessageEffect(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about a message effect. Returns a 404 error if the effect is not found. Returns 'TD.Data.MessageEffect.MessageEffect'
data GetMessageEffect
  = GetMessageEffect
    { effect_id :: Maybe Int -- ^ Unique identifier of the effect
    }
  deriving (Eq, Show)

instance I.ShortShow GetMessageEffect where
  shortShow
    GetMessageEffect
      { effect_id = effect_id_
      }
        = "GetMessageEffect"
          ++ I.cc
          [ "effect_id" `I.p` effect_id_
          ]

instance AT.ToJSON GetMessageEffect where
  toJSON
    GetMessageEffect
      { effect_id = effect_id_
      }
        = A.object
          [ "@type"     A..= AT.String "getMessageEffect"
          , "effect_id" A..= fmap I.writeInt64  effect_id_
          ]

