-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.FinishFileGeneration where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Error as Error

-- |
-- 
-- Finishes the file generation
-- 
-- __generation_id__ The identifier of the generation process
-- 
-- __error__ If set, means that file generation has failed and should be terminated
data FinishFileGeneration = 

 FinishFileGeneration { _error :: Maybe Error.Error, generation_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON FinishFileGeneration where
 toJSON (FinishFileGeneration { _error = _error, generation_id = generation_id }) =
  A.object [ "@type" A..= T.String "finishFileGeneration", "error" A..= _error, "generation_id" A..= generation_id ]

instance T.FromJSON FinishFileGeneration where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "finishFileGeneration" -> parseFinishFileGeneration v
   _ -> mempty
  where
   parseFinishFileGeneration :: A.Value -> T.Parser FinishFileGeneration
   parseFinishFileGeneration = A.withObject "FinishFileGeneration" $ \o -> do
    _error <- o A..:? "error"
    generation_id <- mconcat [ o A..:? "generation_id", readMaybe <$> (o A..: "generation_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ FinishFileGeneration { _error = _error, generation_id = generation_id }