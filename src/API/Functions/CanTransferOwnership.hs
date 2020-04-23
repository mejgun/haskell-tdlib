-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CanTransferOwnership where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CanTransferOwnership = 
 CanTransferOwnership deriving (Show)

instance T.ToJSON CanTransferOwnership where
 toJSON (CanTransferOwnership {  }) =
  A.object [ "@type" A..= T.String "canTransferOwnership" ]

instance T.FromJSON CanTransferOwnership where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "canTransferOwnership" -> parseCanTransferOwnership v
   _ -> mempty
  where
   parseCanTransferOwnership :: A.Value -> T.Parser CanTransferOwnership
   parseCanTransferOwnership = A.withObject "CanTransferOwnership" $ \o -> do
    return $ CanTransferOwnership {  }