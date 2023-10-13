module TD.Data.ClosedVectorPath
  ( ClosedVectorPath(..)    
  , defaultClosedVectorPath 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.VectorPathCommand as VectorPathCommand

data ClosedVectorPath
  = ClosedVectorPath -- ^ Represents a closed vector path. The path begins at the end point of the last command
    { commands :: Maybe [VectorPathCommand.VectorPathCommand] -- ^ List of vector path commands
    }
  deriving (Eq)

instance Show ClosedVectorPath where
  show ClosedVectorPath
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

instance AT.ToJSON ClosedVectorPath where
  toJSON ClosedVectorPath
    { commands = commands_
    }
      = A.object
        [ "@type"    A..= AT.String "closedVectorPath"
        , "commands" A..= commands_
        ]

defaultClosedVectorPath :: ClosedVectorPath
defaultClosedVectorPath =
  ClosedVectorPath
    { commands = Nothing
    }

