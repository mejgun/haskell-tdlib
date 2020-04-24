-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.Destroy where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data Destroy = 
 Destroy deriving (Show, Eq)

instance T.ToJSON Destroy where
 toJSON (Destroy {  }) =
  A.object [ "@type" A..= T.String "destroy" ]

instance T.FromJSON Destroy where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "destroy" -> parseDestroy v
   _ -> mempty
  where
   parseDestroy :: A.Value -> T.Parser Destroy
   parseDestroy = A.withObject "Destroy" $ \o -> do
    return $ Destroy {  }