module TD.Data.Count
  ( Count(..)    
  , defaultCount 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data Count
  = Count -- ^ Contains a counter
    { count :: Maybe Int -- ^ Count
    }
  deriving (Eq)

instance Show Count where
  show Count
    { count = count_
    }
      = "Count"
        ++ I.cc
        [ "count" `I.p` count_
        ]

instance AT.FromJSON Count where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "count" -> parseCount v
      _       -> mempty
    
    where
      parseCount :: A.Value -> AT.Parser Count
      parseCount = A.withObject "Count" $ \o -> do
        count_ <- o A..:?  "count"
        pure $ Count
          { count = count_
          }
  parseJSON _ = mempty

instance AT.ToJSON Count where
  toJSON Count
    { count = count_
    }
      = A.object
        [ "@type" A..= AT.String "count"
        , "count" A..= count_
        ]

defaultCount :: Count
defaultCount =
  Count
    { count = Nothing
    }

