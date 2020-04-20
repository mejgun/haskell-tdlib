-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.Destroy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data Destroy = 
 Destroy -- deriving (Show)

instance T.ToJSON Destroy where
 toJSON (Destroy {  }) =
  A.object [ "@type" A..= T.String "destroy" ]
-- destroy Destroy 



instance T.FromJSON Destroy where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "destroy" -> parseDestroy v
  where
   parseDestroy :: A.Value -> T.Parser Destroy
   parseDestroy = A.withObject "Destroy" $ \o -> do
    return $ Destroy {  }