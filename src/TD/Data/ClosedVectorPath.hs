module TD.Data.ClosedVectorPath
  (ClosedVectorPath(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.VectorPathCommand as VectorPathCommand

data ClosedVectorPath
  = ClosedVectorPath -- ^ Represents a closed vector path. The path begins at the end point of the last command. The coordinate system origin is in the upper-left corner
    { commands :: Maybe [VectorPathCommand.VectorPathCommand] -- ^ List of vector path commands
    }
  deriving (Eq, Show)

instance I.ShortShow ClosedVectorPath where
  shortShow ClosedVectorPath
    { commands = commands_
    }
      = "ClosedVectorPath"
        ++ I.cc
        [ "commands" `I.p` commands_
        ]

instance AT.FromJSON ClosedVectorPath where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "closedVectorPath" -> parseClosedVectorPath v
      _                  -> mempty
    
    where
      parseClosedVectorPath :: A.Value -> AT.Parser ClosedVectorPath
      parseClosedVectorPath = A.withObject "ClosedVectorPath" $ \o -> do
        commands_ <- o A..:?  "commands"
        pure $ ClosedVectorPath
          { commands = commands_
          }
  parseJSON _ = mempty

