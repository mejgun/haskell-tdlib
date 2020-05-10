-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TestUseUpdate where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Does nothing and ensures that the Update object is used; for testing only. This is an offline method. Can be called before authorization
data TestUseUpdate = 

 TestUseUpdate deriving (Show, Eq)

instance T.ToJSON TestUseUpdate where
 toJSON (TestUseUpdate {  }) =
  A.object [ "@type" A..= T.String "testUseUpdate" ]

instance T.FromJSON TestUseUpdate where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "testUseUpdate" -> parseTestUseUpdate v
   _ -> mempty
  where
   parseTestUseUpdate :: A.Value -> T.Parser TestUseUpdate
   parseTestUseUpdate = A.withObject "TestUseUpdate" $ \o -> do
    return $ TestUseUpdate {  }