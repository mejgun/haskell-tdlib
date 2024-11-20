module TD.Data.Outline
  (Outline(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ClosedVectorPath as ClosedVectorPath

data Outline
  = Outline -- ^ Represents outline of an image
    { paths :: Maybe [ClosedVectorPath.ClosedVectorPath] -- ^ The list of closed vector paths
    }
  deriving (Eq, Show)

instance I.ShortShow Outline where
  shortShow Outline
    { paths = paths_
    }
      = "Outline"
        ++ I.cc
        [ "paths" `I.p` paths_
        ]

instance AT.FromJSON Outline where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "outline" -> parseOutline v
      _         -> mempty
    
    where
      parseOutline :: A.Value -> AT.Parser Outline
      parseOutline = A.withObject "Outline" $ \o -> do
        paths_ <- o A..:?  "paths"
        pure $ Outline
          { paths = paths_
          }
  parseJSON _ = mempty

