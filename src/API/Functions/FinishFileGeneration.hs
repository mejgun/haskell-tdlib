-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.FinishFileGeneration where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Error as Error

--main = putStrLn "ok"

data FinishFileGeneration = 
 FinishFileGeneration { _error :: Error.Error, generation_id :: Int }  deriving (Show)

instance T.ToJSON FinishFileGeneration where
 toJSON (FinishFileGeneration { _error = _error, generation_id = generation_id }) =
  A.object [ "@type" A..= T.String "finishFileGeneration", "error" A..= _error, "generation_id" A..= generation_id ]



instance T.FromJSON FinishFileGeneration where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "finishFileGeneration" -> parseFinishFileGeneration v

   _ -> mempty ""
  where
   parseFinishFileGeneration :: A.Value -> T.Parser FinishFileGeneration
   parseFinishFileGeneration = A.withObject "FinishFileGeneration" $ \o -> do
    _error <- o A..: "error"
    generation_id <- o A..: "generation_id"
    return $ FinishFileGeneration { _error = _error, generation_id = generation_id }